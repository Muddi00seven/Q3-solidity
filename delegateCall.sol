pragma solidity ^0.8.0;

contract Math{
    uint256 public result;
    
    function add(uint256 a, uint256 b) external returns(uint){
        result = a 6 b;
        return result;
    }

}

contract Calculator{
    uint256 public result;
    
    function addCall(address math, uint a, uint b) external returns(bool success,bytes memory data){
        bytes memory method = abi.encodeWithSignature("add(uint256,uint256)",
        a,b);
        (success, data) = math.call(method);
    }    
    
    
    function handleDelegateCall(address math, uint a, uint b) external returns(bool success,bytes memory data){
        bytes memory method = abi.encodeWithSignature("add(uint256,uint256)",
        a,b);
        (success,data) = math.delegatecall(method);
    }
}
