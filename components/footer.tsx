import Container from './container'
import {FOOTER_EMAIL} from '../lib/constants'
import {FOOTER_GITHUB} from '../lib/constants'


const Footer = () => {
    return (
        <footer className="bg-neutral-50 border-t border-neutral-200">
            <Container>
                <div className="py-6 flex flex-col lg:flex-row items-center">
                    <div className="mb-8 lg:mb-0 lg:pr-4 lg:w-1/2">
                        <h4
                            className="text-[1.25rem] lg:text-[1.45rem] tracking-tighter leading-tight text-center lg:text-left ">
                            Templates By {' '}
                            <a href="https://github.com/vercel/next.js/tree/canary/examples/blog-starter">
                                Next.js.
                            </a>
                        </h4>
                    </div>
                    <nav className="flex flex-row justify-end items-center lg:w-1/2">
                        <div className="my-auto w-6 h-6 mr-6">
                            <a href={FOOTER_GITHUB}>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="-0.6, -0.6, 26, 26">
                                    <g transform="scale(0.24)">
                                        <path transform="translate(-50%, -50%)" fillRule="evenodd" clipRule="evenodd"
                                              d="M48.854 0C21.839 0 0 22 0 49.217c0 21.756 13.993 40.172 33.405 46.69 2.427.49 3.316-1.059 3.316-2.362 0-1.141-.08-5.052-.08-9.127-13.59 2.934-16.42-5.867-16.42-5.867-2.184-5.704-5.42-7.17-5.42-7.17-4.448-3.015.324-3.015.324-3.015 4.934.326 7.523 5.052 7.523 5.052 4.367 7.496 11.404 5.378 14.235 4.074.404-3.178 1.699-5.378 3.074-6.6-10.839-1.141-22.243-5.378-22.243-24.283 0-5.378 1.94-9.778 5.014-13.2-.485-1.222-2.184-6.275.486-13.038 0 0 4.125-1.304 13.426 5.052a46.97 46.97 0 0 1 12.214-1.63c4.125 0 8.33.571 12.213 1.63 9.302-6.356 13.427-5.052 13.427-5.052 2.67 6.763.97 11.816.485 13.038 3.155 3.422 5.015 7.822 5.015 13.2 0 18.905-11.404 23.06-22.324 24.283 1.78 1.548 3.316 4.481 3.316 9.126 0 6.6-.08 11.897-.08 13.526 0 1.304.89 2.853 3.316 2.364 19.412-6.52 33.405-24.935 33.405-46.691C97.707 22 75.788 0 48.854 0z"
                                              fill="#24292f"/>
                                    </g>
                                </svg>
                            </a>
                        </div>
                        <div className="my-auto w-6 h-6">
                            <a href={FOOTER_EMAIL}>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="2.3, 2.3, 26, 26">
                                    <g transform="scale(1.2)">
                                        <path
                                            d="M1.998 5.5c0-1.381 1.119-2.5 2.5-2.5h15c1.381 0 2.5 1.119 2.5 2.5v13c0 1.381-1.119 2.5-2.5 2.5h-15c-1.381 0-2.5-1.119-2.5-2.5v-13zm2.5-.5c-.276 0-.5.224-.5.5v2.764l8 3.638 8-3.636V5.5c0-.276-.224-.5-.5-.5h-15zm15.5 5.463l-8 3.636-8-3.638V18.5c0 .276.224.5.5.5h15c.276 0 .5-.224.5-.5v-8.037z"></path>
                                    </g>
                                </svg>
                            </a>
                        </div>
                    </nav>
                </div>
            </Container>
        </footer>
    )
}

export default Footer
