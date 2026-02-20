use dep::aztec::{
    protocol::address::AztecAddress, test::helpers::test_environment::TestEnvironment,
};

use crate::Main;

pub unconstrained fn setup_main() -> (TestEnvironment, AztecAddress, AztecAddress) {
    let mut env = TestEnvironment::new();

    let admin = env.create_light_account();

    let initializer_call_interface = Main::interface().constructor(admin);
    let contract_address = env.deploy("Main").with_public_initializer(
        admin,
        initializer_call_interface,
    );
    (env, contract_address, admin)
}
