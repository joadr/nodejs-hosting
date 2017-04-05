import phantom from 'phantom'
import sleep from './sleep'

const waitTime = process.env.PHANTOM_WAIT_TIME || 5000

export default async function (url) {
  const instance = await phantom.create()
  const page = await instance.createPage()
  await page.on('onResourceRequested', function (requestData) {
    console.info('Requesting', requestData.url)
  })

  const status = await page.open(url)
  console.log(status)

  await sleep(waitTime)

  const content = await page.property('content')

  await instance.exit()

  return content
}
