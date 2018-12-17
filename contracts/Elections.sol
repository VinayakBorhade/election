pragma solidity ^0.4.11;

contract Election{
	//model candidate
	struct Candidate{
		uint id;
		string name;
		uint voteCount;
	}
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
}