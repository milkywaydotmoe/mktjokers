SMODS.Joker{ --Dont Tap The Joker
    key = "donttapthejoker",
    config = {
        extra = {
            mult = 100,
        }
    },
    loc_vars = function(self, info_queue, card)
        table.insert(info_queue, G.P_CENTERS.m_glass)
        return { 
            vars = { card.ability.extra.mult } 
        }
    end,
    loc_txt = {
        ['name'] = 'Dont Tap The Joker',
        ['text'] = {
            '{C:mult}+#1#{} Mult',
            '{C:red}Self-destructs{} when',
            'clicked or if a {C:attention}Glass{} card',
            'is destroyed'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',

    calculate = function(self, card, context)
        -- apply mult
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    mult = card.ability.extra.mult,
                    extra = {
                        message = 'DONT TAP THE GLASS.',
                        sound = 'mktjk_dttg'
                    }
                }
                
        end

        -- shat
        if context.destroy_card and context.cardarea == G.play and SMODS.has_enhancement(context.destroy_card, 'm_glass') then 
            return { 
                remove = true 
            } 
        end

        

    end
}