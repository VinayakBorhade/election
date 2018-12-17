pragma solidity ^0.4.11;

contract Election{
	//model candidate
	struct Candidate{
		uint id;
		string name;
		uint voteCount;
	}
	//Store accounts that have voted
	mapping(address => bool) public voters;
	//store candidates
	//fetch candidates
	mapping(uint=>Candidate) public candidates;
	//store candidate count
	uint public candidatesCount;

	function Election () public {
		addCandidate("candidate1");
		addCandidate("candidate2");
	}

	function addCandidate (string _name) private {
		candidatesCount++;
		candidates[candidatesCount]=Candidate(candidatesCount, _name,0);
	}

	function vote (uint _candidateId) public {
		//require that they haven't voted before
		require(!voters[msg.sender]);
		//require a vaild candidate
		require(_candidateId>0 && _candidateId<=candidatesCount);
		//record that voter has voted
		voters[msg.sender]=true;
		//update candidate vote count
		candidates[_candidateId].voteCount++;
	}
}