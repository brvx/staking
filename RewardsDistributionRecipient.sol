pragma solidity >=0.5.16;
//SPDX-License-Identifier: MIT

// Inheritance
import "./Owned.sol";

 abstract contract RewardsDistributionRecipient is Owned {
    address public rewardsDistribution;

    function notifyRewardAmount(uint256 reward) virtual external;

    modifier onlyRewardsDistribution() {
        require(msg.sender == rewardsDistribution, "Caller is not RewardsDistribution contract");
        _;
    }

    function setRewardsDistribution(address _rewardsDistribution) external onlyOwner {
        rewardsDistribution = _rewardsDistribution;
    }
}
