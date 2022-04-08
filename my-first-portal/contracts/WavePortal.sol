// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    mapping(address => uint256) public countofWaves;
    address[] peopleKnown;
    address bestFriend;

    uint256 totalWaves;     //automatically initialised to zero
                            //this is special variable coz its a state 
                            //stored permanantly in contract storage

    constructor() {
        console.log("Yo yo, My first contract is smart");
    }

    function addWaves() public {
      countofWaves[msg.sender] += 1;
      peopleKnown.push(msg.sender);
    }

    function wave() public {
        totalWaves += 1;
        addWaves();
        console.log("%s had sent a wave", msg.sender);  //msg.sender - built-in auth
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }

    function calcBestFriend() public {
        uint max;
        for (uint256 index = 0; index < peopleKnown.length; index++) {
            if( max < countofWaves[peopleKnown[index]]){
                max = countofWaves[peopleKnown[index]];
                bestFriend = peopleKnown[index];
            }
        }
        console.log("We have %d total waves from %s!", max, bestFriend);
    }

    function getBestFriend() public view returns (address) {
        console.log("%s is my bestfriend!", bestFriend);
        return bestFriend;
    }
}