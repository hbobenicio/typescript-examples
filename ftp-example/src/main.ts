import { download, DownloadProps } from './ftp-utils';

const options: DownloadProps = {
  host: 'localhost',
  user: 'myuser',
  password: 'mypass',
  inputFile: 'foo',
  outputFile: 'foo'
};

download(options)
  .then(_ => {
    console.log('Download concluído com sucesso.');
  })
  .catch(error => {
    console.error(`Erro ao baixar arquivo: ${error.message}`);
  });
