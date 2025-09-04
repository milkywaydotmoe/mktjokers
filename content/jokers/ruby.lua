SMODS.Joker{ --ruby
    key = "ruby",
    config = {
        extra = {
            Xmult = 300
        }
    },
    loc_vars = function(self, queue, card) return {
        vars = {
            card.ability.extra.Xmult
        }
    } end,
    loc_txt = {
        ['name'] = '{f:5}ｒｕｂｙ',
        ['text'] = {
            'the person who made entropy',
            '{C:white,X:mult}X#1#{} mult'
        }
    },
    pos = {
        x = 6,
        y = 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    in_pool = function (self, args)
        return false
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.Xmult,
                    message = "sorry i couldnt think of anything better >-<"
                }
        end
    end
}