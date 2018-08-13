import {default as PromiseFTP} from 'promise-ftp';
import * as fs from 'fs';

function rethrowError(error: Error) {
  throw new Error(error.message);
}

export interface DownloadProps {
  host: string;
  user: string;
  password: string;
  inputFile: string;
  outputFile: string;
}

export async function download(props: DownloadProps) {
  const {host, user, password, inputFile, outputFile} = props;

  const ftp = new PromiseFTP();

  const serverName = await ftp.connect({host, user, password})
    .catch(rethrowError);

  console.log(serverName);

  try {
    const stream: NodeJS.ReadableStream = await ftp.get(inputFile);
    
    stream.once('error', rethrowError);

    await stream.pipe(fs.createWriteStream(outputFile));

  } catch (error) {
    rethrowError(error);

  } finally {
    await ftp.end().catch(rethrowError);
  }
}
