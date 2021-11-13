// SPDX-License-Identifier: MIT
pragma solidity >=0.8.10;

/* Package Imports */
import "@hifi-finance/prb-math/contracts/PRBMathUD60x18.sol";

library ShiftDecimals {
    using PRBMathUD60x18 for uint256;

    uint256 public constant kDecimalPlaces18 = 18;

    // Example:
    // input:  (115792089237316195423570985008687907853269984665640564039457_584007911, 9)
    // output: 115792089237316195423570985008687907853269984665640564039457_584007911000000000
    function pad(uint256 x, uint256 num) internal pure returns (uint256 result) {
        uint256 scale = 10**num;
        unchecked {
            if (x > PRBMathUD60x18.MAX_UD60x18 / scale) {
                revert PRBMathUD60x18__FromUintOverflow(x);
            }
            result = x * scale;
        }
    }

    // Example:
    // input:  (115792089237316195423570985008687907853269984665640564039457_584007911432352435, 9)
    // output: 115792089237316195423570985008687907853269984665640564039457_584007911
    function truncate(uint256 x, uint256 num) internal pure returns (uint256) {
        uint256 result;
        uint256 scale = 10**num;
        if (x > PRBMathUD60x18.MAX_WHOLE_UD60x18) {
            revert PRBMathUD60x18__CeilOverflow(x);
        }

        assembly {
            // Equivalent to "x % SCALE" but faster.
            let remainder := mod(x, scale)

            // Equivalent to "SCALE - remainder" but faster.
            result := sub(scale, remainder)
        }
        return result;
    }
}
