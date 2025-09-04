SMODS.Joker{ --Gold Ship
    key = "goldship",
    config = {
        extra = {
            odds = 100,
            Xmult = 1000
        }
    },
    loc_vars = function(self, info_queue, card)
        local num, den = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return { 
            vars = { num, den, card.ability.extra.Xmult,} 
        }
    end,
    loc_txt = {
        ['name'] = 'Gold Ship',
        ['text'] = {
            '{C:green}#1# in #2#{} chance',
            'for {X:mult,C:white}X#3#{} Mult'
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',

        calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if SMODS.pseudorandom_probability(card, 'yourseedhere', 1, card.ability.extra.odds, 'j_mktjk_goldship') then
                return { 
                    Xmult = card.ability.extra.Xmult,
                    extra = {
                        message = 'THE GOATTTTTTTTT',
                        sound = 'mktjk_golshi'
                    }
                }
            end
        end
    end
}