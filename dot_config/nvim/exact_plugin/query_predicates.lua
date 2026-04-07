local predicates = {
    ---@param match table<integer,TSNode[]>
    ---@param predicate any[]
    ---@param any boolean
    ---@return boolean
    ['kind-eq'] = function(match, predicate, any)
        local nodes = match[predicate[2]]
        if not nodes or #nodes == 0 then
            return true
        end

        local types = { unpack(predicate, 3) }
        for _, node in ipairs(nodes) do
            local res = vim.list_contains(types, node:type())
            if any and res then
                return true
            elseif not any and not res then
                return false
            end
        end
        return not any
    end,
}

---@param match table<integer,TSNode[]>
---@param predicate any[]
---@return boolean
vim.treesitter.query.add_predicate('kind-eq?', function(match, _, _, predicate)
    return predicates['kind-eq'](match, predicate, false)
end)

---@param match table<integer,TSNode[]>
---@param predicate any[]
---@return boolean
vim.treesitter.query.add_predicate('any-kind-eq?', function(match, _, _, predicate)
    return predicates['kind-eq'](match, predicate, true)
end)
