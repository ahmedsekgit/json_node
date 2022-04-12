< !DOCTYPE html >
    <
    html >
    <
    head >
    <
    meta charset = "utf-8" >
    <
    meta name = "viewport"
content = "width=device-width" >
    <
    script src = "https://unpkg.com/prettier/standalone.js" > < /script> <
    script src = "https://unpkg.com/@prettier/plugin-php/standalone.js" > < /script> <
    title > Prettier PHP Plugin < /title> <
    /head> <
    body >
    <
    textarea id = "input"
placeholder = "Unformatted input" > & lt; ? php
array_map(function($arg1, $arg2) use($var1, $var2) {
    return $arg1 + $arg2 / ($var + $var2);
}, array("complex" => "code", "with" => "inconsistent", "formatting" => "is", "hard" => "to", "maintain" => true)); < /textarea> <
textarea id = "output"
placeholder = "Prettified output"
readonly > < /textarea>

    <
    script >
    function format() {
        try {
            output.value = prettier.format(input.value, {
                plugins: prettierPlugins,
                parser: "php"
            });
        } catch (error) {
            output.value = error;
        }
    }

format();
input.oninput = format; <
/script> <
/body> <
/html>