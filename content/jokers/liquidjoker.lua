SMODS.Joker{ --MacOS 26 Tahoe Developer Beta 3
    key = "liquidjoker",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Liquid Joker',
        ['text'] = {
            'Played and unscoring cards',
            'in first played hand',
            'become {C:attention}Glass{} cards'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    cost = 12,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',

    loc_vars = function(self, info_queue, card)
        table.insert(info_queue, G.P_CENTERS.m_glass)
    end,

    calculate = function(self, card, context) --card is this joker and context holds information about whats going on right now
    if context.before and not context.blueprint and not context.repetition and G.GAME.current_round.hands_played == 1 then --prevent animations from being repeated when it does nothing
        local unscored = true
        local converted = false
        for k, v in ipairs(context.full_hand) do
            for i, w in ipairs(context.scoring_hand) do
                if v == w then unscored = false end
            end
            if unscored then
                converted = true
                v:set_ability(G.P_CENTERS.m_glass, nil, true)
                G.E_MANAGER:add_event(Event({ -- this is addded to an event because calculations are all completed before the animations are done, using events ensures the animations are synced
                    func = function()
                        v:juice_up()
                        return true
                    end
                })) 
            end
        end
        if converted then
            return {
                message = "Glass", -- localization is ideal here but you'd have to setup a localisation file, midas mask uses localize("k_gold") but an equivalent doesnt exist for glass cards
                card = self
            }
        end
    end
end
}
