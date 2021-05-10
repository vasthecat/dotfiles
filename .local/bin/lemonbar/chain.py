class ArrowModuleChain:
    def __init__(self, right, background="#000000", capped_left=False, capped_right=False):
        self.sep = "\uE0B0" if right else "\uE0B2"

        self.bg = background
        self.right = right

        self.chain = []
        self.modules = []

        self.capped_left = capped_left
        self.capped_right = capped_right

    def append(self, module):
        if len(self.modules) > 0:
            self.chain.pop()
            fg = module["background"]
            bg = self.modules[-1]["background"]
        else:
            bg = module["background"] if self.capped_left else self.bg
            fg = module["background"]

        if not self.right:
            bg, fg = fg, bg
        self.chain.append(self.get_sep(bg, fg))

        bg = module["background"] if self.capped_right else self.bg
        fg = module["background"]

        if not self.right:
            bg, fg = fg, bg

        self.chain.append(self.get_sep(fg, bg))

        self.modules.append(module)

    def extend(self, *modules):
        for module in modules:
            self.append(module)

    def get_sep(self, fg, bg):
        return f"%{{F{fg}}}%{{B{bg}}}{self.sep}"

    def __str__(self):
        result = []
        for i in range(len(self.modules)):
            result.append(self.chain[i])

            bg = self.modules[i]["background"]
            fg = self.modules[i]["foreground"]
            text = self.modules[i]["callback"]()
            text = f"%{{F{fg}}}%{{B{bg}}} {text} "
            result.append(text)

        if len(self.chain) > 0:
            result.append(self.chain[-1])

        return "".join(result)

