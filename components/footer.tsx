import Container from './container'
import { EXAMPLE_PATH } from '../lib/constants'

const Footer = () => {
  return (
    <footer className="bg-neutral-50 border-t border-neutral-200">
      <Container>
        <div className="py-4 flex flex-col lg:flex-row items-center">
          <h4 className="text-1xl lg:text-[1.45rem] tracking-tighter leading-tight text-center lg:text-left mb-0 lg:pr-4 lg:w-1/2">
            Templates By {' '}
              <a href="https://github.com/vercel/next.js/tree/canary/examples/blog-starter">
                Next.js.
            </a>
          </h4>
          <div className="flex flex-col lg:flex-row justify-center items-center lg:pl-4 lg:w-1/2">
            {/*<a*/}
            {/*  href="https://nextjs.org/docs/basic-features/pages"*/}
            {/*  className="mx-3 text-black font-bold py-3 px-10 lg:px-7 duration-200 transition-colors mb-6 lg:mb-0"*/}
            {/*>*/}
            {/*  Read Documentation*/}
            {/*</a>*/}
            {/*<a*/}
            {/*  href={`https://github.com/vercel/next.js/tree/canary/examples/${EXAMPLE_PATH}`}*/}
            {/*  className="mx-3 font-bold hover:underline"*/}
            {/*>*/}
            {/*  View on GitHub*/}
            {/*</a>*/}
          </div>
        </div>
      </Container>
    </footer>
  )
}

export default Footer
