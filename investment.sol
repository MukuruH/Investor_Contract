
pragma solidity 0.7.0;
 
import "./SafeMath.sol";

contract doublebleDouble {

    using SafeMath for uint256;

    address payable owner;
    // uint256 currentbalance;
    event payment_recieved(address _investor, uint256 _amount, uint256 expectedReturn);
    uint256 maintainanceShedule;

    // struct Investor {
    //     address payable _address;
    //     uint256 accountBalance;
    // }

    // Investor[] public investors; 

    constructor () public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }   

    mapping (address => uint) accountBalance;
    mapping (address => uint256) profitGained;

    function calculateReturn (uint256 _amount) pure public returns(uint256) {
        uint256 profitMargin = 0.2;
        return uint256 = _amount.mul(profitMargin);
    }

    function increaseInvestment(address _investor, uint256 _investment) internal {
        // uint256 id =investors.push(Investor(msg.sender, uint256(accountBalance + _investment)))
        uint256(accountBalance[_investor] += _investment);
    }

    function serviceCharge(address payable _hardWorker, uint256 _serviceFee) internal {
        _hardWorker.transfer(_serviceFee);
    }
     
    function() external payable {
        invest();
    }

    function invest() internal payable checkBalance { 
        if (msg.value < 0.05 ether) {
            revert();
            return "Payments should not be less than 0.05 ether"        
        }
        uint256 _deposit = msg.value; 
        serviceCharge(owner, uint256(_deposit.mul(0.1)));
        increaseInvestment(msg.sender, msg.value);
        uint256 _profit = calculateReturn(_deposit);
        uint256(profitGained[msg.sender]) += profit;
        emit payment_recieved(msg.sender, _deposit, uint256(_deposit.add(_profit)));
    }

    function addReturn () payable external onlyOwner {
        owner.transfer(msg.value);

    }
}