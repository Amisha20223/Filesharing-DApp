// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.24;

contract UserData {
    struct File{
        uint id;
        string url;
    }
    
    mapping(address=>File []) _userdata;
    File [] __;

    function addFile(address _user, string memory url) public {
        File memory f = File(_userdata[_user].length+1,url);
        _userdata[_user].push(f);
    }

    function removeFile(address _user,uint id) public {
        require(id>0,"Invalid id");
        File[] storage temp = __;
        for(uint x = 0; x < _userdata[_user].length; x++){
            if(_userdata[_user][x].id == id){
                continue;
            }
            else{
                temp.push( _userdata[_user][x]);
            }
        }
        _userdata[_user] = temp;
    }
    function getFiles(address _user) public view returns (File[] memory) {
        return _userdata[_user];
    }
}