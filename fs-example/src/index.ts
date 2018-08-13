import * as fs from 'fs'

function criarArquivo(filePath: string) {
  const data: string = 'Hello, FS!'

  fs.writeFileSync(filePath, data)
}

console.log('Criando arquivo...')
criarArquivo('/tmp/deu-certo.txt')
console.log('Arquivo criado com sucesso!')
