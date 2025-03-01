{
    writeShellScriptBin,
    c,
    d,
}:
writeShellScriptBin "hello" ''
    echo "Hello, ${c} and ${d}!"
''