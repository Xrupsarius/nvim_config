local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local d = ls.dynamic_node

-- Python snippets
ls.add_snippets("python", {

    -- Функция
    s("def", {
        t("def "), i(1, "function_name"), t("("), i(2, "args"), t("):"),
        t({"", "    "}), i(0)
    }),

    -- Класс
    s("class", {
        t("class "), i(1, "ClassName"), t("("), i(2, "object"), t("):"),
        t({"", "    def __init__("}), i(3, "self"), t(", "), i(4, "args"), t("):"),
        t({"", "        "}), i(0)
    }),

    -- Print f-string
    s("p", {
        t('print(f"'), i(1, "text"), t('")'), i(0)
    }),

    -- TODO с текущей датой
    s("todo", {
        t("# TODO: "), d(1, function() return sn(nil, { t(os.date("%Y-%m-%d")) }) end),
        t(" "), i(0)
    }),

    -- Импорт с выбором
    s("im", {
        t("import "), c(1, { t("os"), t("sys"), t("json") }), i(0)
    }),
})

