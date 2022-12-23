# frozen_string_literal: true

# two classes: Dealer (ai) & Player (user)

# game:
# 1. player picks name
# 2. both start with 100$
# 3. player gets 2 cards, opened to player
# 4. dealer gets 2 cards, closed to player
# 5. player knows his points: 2-10 = same num, pictures = 10, ace = 1 or 11 (closest to 21 or lowest to 21+)
# 6. player and dealer put 10$ in bank
# 7. player's turn with 3 choices: skip, add 1 card, open hand (round ends)
# 8. dealer's turn with 2 choises: skip (if points>17), add 1 card (if points<17)
# 9. hands are opened, if both have 3 cards or if player chooses to open hand (max hand is 3 cards)
# 10. game results shown: closest to 21 wins; if player has >21, he loses; if equal points - round draw
# 11. winner gets money from bank
# 12. ask player if he wants 1 more round or end game