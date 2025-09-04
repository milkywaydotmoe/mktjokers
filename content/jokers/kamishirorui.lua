SMODS.Joker{ --神代 類
    key = "kamishirorui",
    config = {
        extra = {
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = '{f:5}神代 類',
        ['text'] = {
            'If {C:attention}2{} or more {C:attention}Kings{} are played,',
            'create a {V:1}Perishable{} {C:dark_edition}Negative{} copy',
            'of the {C:attention}leftmost{} Joker'
        }
    },
    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'mktjk_kamishirorui_name', set = 'Other'}
        info_queue[#info_queue + 1] = G.P_CENTERS.perishable -- doesn't work
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        return {vars = {colours = {{0.31, 0.37, 0.63, 1}}}}
    end,
    pos = {
        x = 8,
        y = 1
    },
    cost = 12,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',

-- note to self. find a way to make the ruis stop mitosing. 
-- it works for now but this will eventually crash the game.
-- too bad!

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
    local rankCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:get_id() == 13 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 2
end)() then
                local target_joker = G.jokers.cards[1] or nil
                
                if target_joker then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local copied_joker = copy_card(target_joker, nil, nil, nil, target_joker.edition and target_joker.edition.negative)
                            copied_joker:set_edition("e_negative", true)
                            copied_joker:add_sticker('perishable', true)
                            copied_joker:add_sticker('eternal', false)
                            copied_joker:add_to_deck()
                            copied_joker.ability.eternal = false
                            G.jokers:emplace(copied_joker)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {
                        message = "High Pressure Washing Machine~", 
                        colour = G.C.GREEN,
                        sound = 'mktjk_ruisilly'
                    })
                end
            end
        end
    end
}