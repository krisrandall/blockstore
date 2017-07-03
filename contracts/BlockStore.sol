pragma solidity ^0.4.0;

contract BlockStore {
    
    struct KeyValueStore {
        mapping(string => string) keyValuePair;
    }

    function BlockStore() {
        
    }
    
    mapping(address => KeyValueStore) blockStorage;
    
    function Store(string _key, string _value) {
        KeyValueStore store = blockStorage[msg.sender];
        store.keyValuePair[_key] = _value;
    }
    
    function Fetch(string _key) returns (string _value) {
        KeyValueStore store = blockStorage[msg.sender];
        return store.keyValuePair[_key];
    }
    
}
