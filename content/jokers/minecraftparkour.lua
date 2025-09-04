SMODS.Joker{ --Minecraft Parkour
    key = "mcparkour",
    config = {
        extra = {
            multvar = 2,
            Xmult_min = 1,
            Xmult_max = 4
        }
    },
    loc_txt = {
        ['name'] = 'Minecraft Parkour',
        ['text'] = {
            [1] = '{X:red,C:white}X1-4{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'mcparkour',

    loc_vars = function(self, info_queue, card)
        return { 
            vars = { card.ability.extra.Xmult_min, card.ability.extra.Xmult_max } 
        }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = pseudorandom('Xmult_681564cc', card.ability.extra.Xmult_min, card.ability.extra.Xmult_max)
                }
        end
    end
}