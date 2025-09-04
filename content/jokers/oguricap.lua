SMODS.Joker{ --Oguri Cap
    key = "oguricap",
    config = {
        extra = {
            dollars = 50,
            odds = 20,
            dollars2 = 9690
        }
    },
    loc_vars = function(self, info_queue, card)
        local num, den = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return { 
            vars = { num, den, card.ability.extra.dollars, card.ability.extra.dollars2 } 
        }
    end,
    loc_txt = {
        ['name'] = 'Oguri Cap',
        ['text'] = {
            '{C:green}#1# in #2#{} chance to lose',
            '{C:money}$#4${} at end of round',
            'due to Oguri Cap',
            'ordering {C:attention}969{} 10 piece',
            'bucket meals at KFC',
            'Otherwise, earn {C:money}#3#${}',
            'at end of round'
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    cost = 1,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',

    calculate = function(self, card, context)
        if context.end_of_round and not context.game_over and context.main_eval then
            if SMODS.pseudorandom_probability(card, 'yourseedhere', 1, card.ability.extra.odds, 'j_mktjk_oguricap') then
                return {
                    dollars = -card.ability.extra.dollars2,
                    extra = {
                        message = 'Fatty.',
                        sound = 'mktjk_fatty'
                    }
                }
            else
                return {
                    dollars = card.ability.extra.dollars 
                }
            end
        end
    end
}