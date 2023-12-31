// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

//import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "./Initializable.sol";
import "./OwnableUpgradeable.sol";
import "./UUPSUpgradeable.sol";
import "./Strings.sol";
import "./ECDSA.sol";
/**
 * @dev Interface of the SellToken standard as defined in the EIP.
 * From https://github.com/OpenZeppelin/openzeppelin-contracts
 */



/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 * From https://github.com/OpenZeppelin/openzeppelin-contracts
 */
interface IERC20 {
  /**
   * @dev Returns the amount of tokens in existence.
   */
  function totalSupply() external view returns (uint256);

  /**
   * @dev Returns the amount of tokens owned by `account`.
   */
  function balanceOf(address account) external view returns (uint256);

  /**
   * @dev Moves `amount` tokens from the caller's account to `recipient`.
   *
   * Returns a boolean value indicating whether the operation succeeded.
   *
   * Emits a {Transfer} event.
   */
  function transfer(address recipient, uint256 amount) external returns (bool);

  /**
   * @dev Returns the remaining number of tokens that `spender` will be
   * allowed to spend on behalf of `owner` through {transferFrom}. This is
   * zero by default.
   *
   * This value changes when {approve} or {transferFrom} are called.
   */
  function allowance(address owner, address spender) external view returns (uint256);

  /**
   * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
   *
   * Returns a boolean value indicating whether the operation succeeded.
   *
   * IMPORTANT: Beware that changing an allowance with this method brings the risk
   * that someone may use both the old and the new allowance by unfortunate
   * transaction ordering. One possible solution to mitigate this race
   * condition is to first reduce the spender's allowance to 0 and set the
   * desired value afterwards:
   * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
   *
   * Emits an {Approval} event.
   */
  function approve(address spender, uint256 amount) external returns (bool);

  /**
   * @dev Moves `amount` tokens from `sender` to `recipient` using the
   * allowance mechanism. `amount` is then deducted from the caller's
   * allowance.
   *
   * Returns a boolean value indicating whether the operation succeeded.
   *
   * Emits a {Transfer} event.
   */
  function transferFrom(
    address sender,
    address recipient,
    uint256 amount
  ) external returns (bool);

  /**
   * @dev Emitted when `value` tokens are moved from one account (`from`) to
   * another (`to`).
   *
   * Note that `value` may be zero.
   */
  event Transfer(address indexed from, address indexed to, uint256 value);

  /**
   * @dev Emitted when the allowance of a `spender` for an `owner` is set by
   * a call to {approve}. `value` is the new allowance.
   */
  event Approval(address indexed owner, address indexed spender, uint256 value);
}


contract PresaleV1 is Initializable, OwnableUpgradeable, UUPSUpgradeable {

  address public IDOAdmin;
  address public IDO_TOKEN;
  address public USDT_CONTRACT;
  address public IDO_RECEIVER;
  address public priceSource; 

  uint256 public minDepositAmt;
  uint256 public eth_ref_rate;
  uint256 public usd_ref_rate;
  uint256 public eth_buy_rate;
  uint256 public usd_buy_rate;
  uint256 public totalTokensSold;
  uint256 public decimal;
  mapping (address => uint256) public buyerAmount;
  mapping (address => bool) public hasclaimed;
  bool public canclaimpresale = false;
  bool public usdrefenabled = false;
  bool public ethrefenabled = false;
  address public IDOSubAdmin;
  
  modifier onlyIDOAdmin() {
    require(msg.sender == IDOAdmin, 'INVALID IDO ADMIN');
    _;
  }

 /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

  function initialize(
    address _idoAdmin,
    address _idoToken
  ) public initializer {
    IDOAdmin = _idoAdmin;
    IDO_TOKEN = _idoToken;
    __Ownable_init();
    __UUPSUpgradeable_init();
  }


  function claimpresale(uint256 _amount, bytes memory signature) public returns (bool) {
    return true; 
  }

  /**
   * @dev execute buy token
   * @return true if the transfer succeeds, false otherwise
   **/
  function buyWithEth(address _referrer) public payable returns (bool) {
    return (true);
  }

  /**
   * @dev execute buy Token
   **/
  function buyWithUsdt(uint256 buy_amount, address _referrer) public returns (uint256) {
    return 0;
  }


    function _authorizeUpgrade(address newImplementation)
        internal
        onlyOwner
        override
    {}
}
