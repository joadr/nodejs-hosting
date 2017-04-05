import phantom from 'phantom'

export default async function (url) {
  const instance = await phantom.create()
  const page = await instance.createPage()
  await page.on('onResourceRequested', function (requestData) {
    console.info('Requesting', requestData.url)
  })

  const status = await page.open(url)
  console.log(status)

  const content = await page.property('content')

  await instance.exit()

  return content
}
