use crate::Main;
use crate::test::utils;
use dep::aztec::protocol::address::AztecAddress;
use dep::aztec::protocol::storage::map::derive_storage_slot_in_map;

#[test]
unconstrained fn test_issue_note() {
    let (mut env, contract_address, admin) = utils::setup_main();
    let data: [Field; 8] = [
        Field::from(1),
        Field::from(2),
        Field::from(0),
        Field::from(645494400),
        Field::from(3),
        Field::from(1),
        Field::from(0),
        Field::from(0),
    ];

    env.call_private(
        contract_address,
        Main::at(contract_address).issue_note(data),
    );
}

