SMODS.Joker{ --Mr. Morale and the Big Steppers
    key = "mrmorale",
    config = {
        extra = {
            discarded = 0,
            increment = 18,
            discreq = 15,
            mult = 0
        }
    },
    loc_vars = function(self, queue, card) return {
        vars = {
            card.ability.extra.discarded,
            card.ability.extra.increment,
            card.ability.extra.discreq,
            card.ability.extra.mult
        }
    } end,
    loc_txt = {
        ['name'] = 'Mr. Morale and the Big Steppers',
        ['text'] = {
            'This Joker gains {C:red}+#2#{} Mult',
            'every {C:attention}#3#{} cards discarded',
            '{C:inactive}Currently {C:red}+#4#{C:inactive} Mult (#1# cards discarded){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',

    calculate = function(self, card, context)
        if context.discard then
            if (card.ability.extra.discarded or 0) >= card.ability.extra.discreq - 1 or (card.ability.extra.discarded or 0) == card.ability.extra.discreq then
                return {
                    func = function()
                    card.ability.extra.mult = (card.ability.extra.mult) + ((card.ability.extra.discarded / card.ability.extra.increment) * card.ability.extra.increment)
                    return true
                end,
                    extra = {
                        func = function()
                    card.ability.extra.discarded = 0
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
            else
                return {
                    func = function()
                    card.ability.extra.discarded = (card.ability.extra.discarded) + 1
                    return true
                end
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if (card.ability.extra.mult or 0) ~= 0 then
                return {
                    mult = card.ability.extra.mult,
                    extra = {
                        message = 'i grieve dih...',
                        sound = 'mktjk_grievedih'
                    }
                }
            end
        end
    end
}