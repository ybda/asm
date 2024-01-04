build_dir := "./build"
src_dir := "./src"

build TARGET:
    nasm {{src_dir}}/{{TARGET}}.asm -f elf -o {{build_dir}}/{{TARGET}}.o
    ld {{build_dir}}/{{TARGET}}.o --strip-all -m elf_i386 --output {{build_dir}}/{{TARGET}}

run TARGET: (build TARGET)
    {{build_dir}}/{{TARGET}}
    
