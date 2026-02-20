
use aztec::{macros::notes::note, protocol::traits::Packable};

#[derive(Eq, Packable)]
#[note]
pub struct Note {
    pub content_id: Field,
    pub data: [Field; 8],
}

impl Note {
    pub fn new(content_id: Field, data: [Field; 8]) -> Self {
        Self { content_id, data }
        // Self { content_id }
    }
}