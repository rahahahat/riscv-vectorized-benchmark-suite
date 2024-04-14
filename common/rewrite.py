import re
regex = r"^#define\s(\w+)\(([op1-5,\s]+)\)\s+([\w]+)\(([op1-5,\s]+)\)"

rfl = open("./vector_defines_old.h", "r")
wfl = open("./vector_defines.h", "w")


for line in rfl.readlines():
    if match := re.search(regex, line):
        macro, m_ops, func, f_ops = match.groups()
        new_macro = "#define %s(%s) __riscv_%s(%s)\n" % (macro, m_ops, func, f_ops)
        wfl.write(new_macro)
    else:
        wfl.write(line)

rfl.close()
wfl.close()