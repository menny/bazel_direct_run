script_template_error = """\
echo "hello from {name}"
"""

def _impl_sh(ctx):
    # Emit the executable shell script.
    script = ctx.actions.declare_file('%s-print.sh' % ctx.label.name)
    script_content = script_template_error.format(
        name = ctx.label.name
    )
    ctx.actions.write(script, script_content, is_executable=True)

    return [DefaultInfo(executable=script)]

sh_print_rule = rule(implementation=_impl_sh, executable=True,
    outputs={"out": "%{name}-print.sh"})