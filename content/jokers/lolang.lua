SMODS.Joker{ --lolang from librarby of runia
    key = "lolang",
    config = {
        extra = {
            xchips = 2
        }
    },
    loc_txt = {
        ['name'] = 'lolang from librarby of runia',
        ['text'] = {
            [1] = '{C:white,X:chips}X2{} Chips if played',
            [2] = 'hand contains a {C:attention}Queen{}',
            [3] = '',
            [4] = '{s:0.7,C:inactive,E:1}Himdeul-eoss-eoyo? Jichyeoss-eoyo. Swigosip-eoyo?{}',
            [5] = '{s:0.7,C:inactive,E:1}Baegopayo. Nagago sip-eoyo. {}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 3
    },
    cost = 4,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
    local rankCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:get_id() == 12 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 1
end)() then
                return {
                    x_chips = card.ability.extra.xchips,
                    message = "wahhhh my wife is dead...."
                }
            end
        end
    end
}