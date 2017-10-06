pragma solidity ^0.4.0;

contract BlockStore {
    
    struct KeyValueStore {
        mapping(string => string) keyValuePair;
    }
    
    mapping(address => KeyValueStore) blockStorage;
    
    function store(string _key, string _value) returns (string _stored_val) {
        KeyValueStore store = blockStorage[msg.sender];
        store.keyValuePair[_key] = _value;
        return _value;
    }
    
    function fetch(string _key) returns (string _value) {
        KeyValueStore store = blockStorage[msg.sender];
        return store.keyValuePair[_key];
    }
    
}
