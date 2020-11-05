// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
 
import "github.com/OpenZeppelin/zeppelin-solidity/contracts/math/SafeMath.sol";

contract doublebleDouble {

    using SafeMath for uint256;

    address payable owner;
    address payable bigSpender;
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
    mapping (address => uint256) depositTime;

    function calculateReturn (uint256 _amount) pure public returns(uint256 ) {
        return  ((_amount.mul(2))/10);
    }

     
    function deposit(uint256 amount) external payable {
        require(msg.value == amount);
        invest();
    }

    function invest() public payable { 
        if (msg.value < 50000000 wei) {
            revert();
        }
        uint256 _deposit = msg.value; 
        owner.transfer(uint256((_deposit.mul(1))/10));
        accountBalance[msg.sender] += msg.value;
        uint256 _profit = calculateReturn(_deposit);
        profitGained[msg.sender] += _profit ;
        depositTime[msg.sender] = now;
        emit payment_recieved(msg.sender, _deposit, uint256(_deposit.add(_profit)));
    }
    
    function checkAccount() external {
        
    }

    function collectReturn (uint256 _withdraw) payable external {
        require(accountBalance[msg.sender] >= 1, "You do not have any cash with us");
       require(accountBalance[msg.sender] <= _withdraw, "This amount exceeds your current account balance");
       owner.transfer(100);
    //   uint256 rewardTime = ((depositTime[msg.sender]) + 1 days); 
        bigSpender = msg.sender;
    //   if (now >= rewardTime){
           bigSpender.transfer(_withdraw);
    //   }
       
    }        
}