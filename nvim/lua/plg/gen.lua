require('gen').prompts['Complete'] = {
    prompt =
    "Regarding the following code, Complete this code, only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
    replace = true,
    extract = "```$filetype\n(.-)```",
}
