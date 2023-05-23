import { AppProps } from 'next/app'
import '../styles/index.css'
import  '../styles/prismJs-aHighlighter.css'

export default function MyApp({ Component, pageProps }: AppProps) {
  return <Component {...pageProps} />
}
