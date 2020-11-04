
pragma solidity 0.7.0;
 
import "./SafeMath.sol";

contract doublebleDouble {

    using SafeMath for uint256;

    address owner;
    uint256 currentbalance;
    event payment_recieved(address _investor, uint256 _amount, uint256 expectedReturn);

    // struct Investor {
    //     address payable _address;
    //     uint256 accountBalance;
    // }

    // Investor[] public investors;    

    mapping (address => uint) accountBalance;

    modifier _onlyOwner() {
        require 
        _;
    }

    function calculateReturn (uint256 _amount) pure public returns(uint256) {
        uint256 profitMargin = 0.2;
        return uint256 = _amount.mul(profitMargin);
    }

    function increaseInvestment(address _investor, uint256 _investment) internal returns(uint256) {
        // uint256 id =investors.push(Investor(msg.sender, uint256(accountBalance + _investment)))
        return uint256(accountBalance[_investor] + _investment);

    }

    function serviceCharge(address payable _hardWorker, uint256 _investedAmount){

    }

    function invest(address bigSpender, uint256 _deposit) external checkBalance { 
        require(msg.sender.balance >= _deposit,"You dont have enough currency to invest");
        msg.sender
        increaseInvestment(bigSpender, _deposit);
        uint256 _profit = calculateReturn(_deposit);
        increaseInvestment(bigSpender, uint256(_deposit.add(_profit)));
        emit payment_recieved(bigSpender, _deposit, uint256(_deposit.add(_profit)));
        serviceCharge
 
    }

    
}