use aztec::macros::aztec;

mod note;
mod test;

#[aztec]
contract Main {
    use aztec::{
        authwit::auth::compute_authwit_nullifier,
        macros::{functions::{authorize_once, external, initializer, only_self}, storage::storage},
        messages::message_delivery::MessageDelivery,
        note::{
            note_getter_options::NoteGetterOptions, note_interface::NoteProperties,
            note_viewer_options::NoteViewerOptions,
        },
        utils::comparison::Comparator,
        protocol::address::AztecAddress,
        state_vars::{DelayedPublicMutable, Map, Owned, PrivateSet, PublicMutable},
    };
    use crate::note::Note;

    #[storage]
    struct Storage<Context> {
        content_notes: Owned<PrivateSet<Note, Context>, Context>,
    }


    #[external("public")]
    #[initializer]
    fn constructor(admin: AztecAddress) {
    }

    #[external("private")]
    fn issue_note(
        data: [Field; 8],
    ) {
        let user = self.msg_sender();
        let content_note_0 = Note::new(0, data);
        self.storage.content_notes.at(user).insert(content_note_0).deliver(MessageDelivery.ONCHAIN_CONSTRAINED);
    }

}
