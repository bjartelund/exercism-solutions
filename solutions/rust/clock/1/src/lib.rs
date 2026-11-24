use std::fmt;

#[derive(Debug, PartialEq, Eq)]
pub struct Clock{
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let minutes = (hours * 60 + minutes).rem_euclid(24*60);

        Self {minutes}
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Self::new(0, self.minutes + minutes)
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let hours = self.minutes / 60;
        let minutes = self.minutes % 60;

        write!(f, "{hours:02}:{minutes:02}")
    }
}