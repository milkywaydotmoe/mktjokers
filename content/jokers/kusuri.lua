SMODS.Joker{ --Yakuzen Kusuri
    key = "kusuri",
    config = {
        extra = {
            odds = 5
        }
    },
    loc_txt = {
        ['name'] = '{f:5}薬膳 楠莉',
        ['text'] = {
            'Each scored card has',
            'a {C:green}1 in 5{} chance to',
            'gain a random {C:attention}Enhancement{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    loc_vars = function (self, queue, card)
        queue[#queue+1] = {key = 'mktjk_kusuri_name', set = 'Other'}
    end,
    pos = {
        x = 2,
        y = 3
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
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_b87d2821', 1, card.ability.extra.odds, 'j_modprefix_kusuri') then
                      local enhancement_pool = {}
                for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                    if enhancement.key ~= 'm_stone' then
                        enhancement_pool[#enhancement_pool + 1] = enhancement
                    end
                end
                local random_enhancement = pseudorandom_element(enhancement_pool, 'edit_card_enhancement')
                context.other_card:set_ability(random_enhancement)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.BLUE})
                  end
            end
        end
    end
}