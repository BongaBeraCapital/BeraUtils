// SPDX-License-Identifier: MIT
pragma solidity =0.8.10;

/* Package Imports */
import { u60x18, u60x18_t } from "./Math.sol";

library TypeSwaps {
    using u60x18 for u60x18_t;

    function asAddress(bytes32 inBytes32) internal pure returns (address) {
        return address(uint160(uint256(inBytes32)));
    }

    function asUint256(u60x18_t inu60x18) internal pure returns (uint256) {
        return u60x18_t.unwrap(inu60x18);
    }

    function asUint256(bytes32 inBytes32) internal pure returns (uint256) {
        return uint256(inBytes32);
    }

    function asU60x18(uint256 inNum) internal pure returns (u60x18_t) {
        return u60x18_t.wrap(inNum);
    }

    function asU60x18(bytes32 inBytes32) internal pure returns (u60x18_t) {
        return u60x18_t.wrap(uint256(inBytes32));
    }

    function asBytes32(u60x18_t inNum) internal pure returns (bytes32) {
        return bytes32(u60x18_t.unwrap(inNum));
    }

    function asBytes32(address inAddress) internal pure returns (bytes32) {
        return bytes32(bytes20(inAddress));
    }

    function asBytes32(uint256 inNum) internal pure returns (bytes32) {
        return bytes32(inNum);
    }
}
