{
    writeShellScriptBin,
    a,
}:
writeShellScriptBin "hello" ''
    echo "Hello, ${a}!"
''