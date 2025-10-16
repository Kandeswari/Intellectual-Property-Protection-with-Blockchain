// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract IPRegistry {
    struct IPAsset {
        string title;
        string ipHash; // Could be a hash of the actual document (e.g., SHA256)
        address owner;
        uint256 registeredAt;
        bool isActive;
    }

    address public admin;
    uint256 public totalRegistered;

    mapping(bytes32 => IPAsset) public ipAssets;  // Mapping from ID hash to asset
    mapping(address => uint256) public userRegistrations; // Count per user

    event IPRegistered(bytes32 indexed ipId, address indexed owner, string title, uint256 timestamp);
    event IPTransferred(bytes32 indexed ipId, address indexed oldOwner, address indexed newOwner);
    event IPRevoked(bytes32 indexed ipId, address indexed revokedBy);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action.");
        _;
    }

    modifier onlyOwner(bytes32 ipId) {
        require(ipAssets[ipId].owner == msg.sender, "Not the owner of this IP.");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function registerIP(string memory title, string memory ipHash) public returns (bytes32) {
        bytes32 ipId = keccak256(abi.encodePacked(msg.sender, ipHash, block.timestamp));

        require(ipAssets[ipId].registeredAt == 0, "IP already registered.");

        ipAssets[ipId] = IPAsset({
            title: title,
            ipHash: ipHash,
            owner: msg.sender,
            registeredAt: block.timestamp,
            isActive: true
        });

        totalRegistered++;
        userRegistrations[msg.sender]++;

        emit IPRegistered(ipId, msg.sender, title, block.timestamp);
        return ipId;
    }

    function transferOwnership(bytes32 ipId, address newOwner) public onlyOwner(ipId) {
        require(ipAssets[ipId].isActive, "IP is inactive or revoked.");
        require(newOwner != address(0), "Invalid new owner.");

        address oldOwner = ipAssets[ipId].owner;
        ipAssets[ipId].owner = newOwner;

        emit IPTransferred(ipId, oldOwner, newOwner);
    }

    function getIPDetails(bytes32 ipId) public view returns (
        string memory title,
        string memory ipHash,
        address owner,
        uint256 registeredAt,
        bool isActive
    ) {
        IPAsset memory asset = ipAssets[ipId];
        return (
            asset.title,
            asset.ipHash,
            asset.owner,
            asset.registeredAt,
            asset.isActive
        );
    }

    function revokeIP(bytes32 ipId) public onlyAdmin {
        require(ipAssets[ipId].isActive, "IP is already revoked.");
        ipAssets[ipId].isActive = false;

        emit IPRevoked(ipId, msg.sender);
    }

    function isIPActive(bytes32 ipId) public view returns (bool) {
        return ipAssets[ipId].isActive;
    }
}
