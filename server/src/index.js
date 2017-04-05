import express from 'express'
import getContent from './getContent'
import shouldCompile from './shouldCompile'
import url from 'url'
import fs from 'fs'

const app = express()

const appInProject = process.env.APP_LOCATION === '.' ? '' : process.env.APP_LOCATION + '/'
const basePath = '/home/deploy/app/' + appInProject + 'build'

app.get('*', async function (request, response) {
  const compile = shouldCompile(request)
  const pathname = url.parse(request.url).pathname
  if (compile) {
    const fullUrl = request.protocol + '://' + request.get('host') + request.originalUrl.replace('_escaped_fragment_', '')
    const content = await getContent(fullUrl)
    response.send(content)
  } else {
    const existsAndNoFolder = fs.existsSync(basePath + pathname) && !fs.lstatSync(basePath + pathname).isDirectory()
    const path = existsAndNoFolder ? basePath + pathname : basePath + '/index.html'
    console.log('serving', path)
    fs.createReadStream(path).pipe(response)
  }
})

app.listen(80, function () {
  console.log('Orion Hosting React app started')
})
