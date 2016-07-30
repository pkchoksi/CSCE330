color(red).
color(yellow).
color(orange).

solution(Holland, Belgium, France, Germany, Swiss, Italy, Austria) :- color(Holland), color(Belgium), color(France), color(Germany), color(Swiss), color(Italy), color(Austria), not(Holland=Belgium), not(Holland=Germany), not(Belgium=France), not(Belgium=Germany), not(France=Germany), not(France=Swiss), not(France=Italy), not(Germany=Swiss), not(Germany=Austria), not(Swiss=Italy), not(Swiss=Austria), not(Italy=Austria).
