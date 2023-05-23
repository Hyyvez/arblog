import markdownStyles from './markdown-styles.module.css'
import {rehype} from 'rehype'
import rehypePrism from 'rehype-prism-plus'


type Props = {
    content: string
}

const PostBody = ({ content }: Props) => {
    const classedInjectedContent =
        rehype()
        .use(rehypePrism)
        .processSync(content)

    return (
        <div className="max-w-5xl mx-auto">
            <div
                className={markdownStyles['markdown']}
                dangerouslySetInnerHTML={{ __html: classedInjectedContent }}
            />
        </div>
    )
}

export default PostBody
