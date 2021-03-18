use std::env;
use std::io::{stdout, Write};
use std::{ops::Add, thread, time};
use sysinfo::{ComponentExt, NetworkExt, NetworksExt, ProcessorExt, System, SystemExt};

fn main() {
    let mut args = env::args().skip(1);
    let args = args.next();

    let sout = stdout();
    let mut sout = sout.lock();
    let instant = time::Duration::from_secs(1);
    let mut now = chrono::Local::now();
    let mut sys = System::new_all();

    if args == Some(String::from("bug")) {
        loop {
            now = now.add(chrono::Duration::seconds(1));
            for (interface_name, data) in sys.get_networks().iter() {
                if interface_name == "wls8" {
                    writeln!(
                        sout,
                        "%{{r}} [D:{} U:{}] [C:{}] [R:{}] [T:{:?}] [{}]",
                        data.get_received(),
                        data.get_transmitted(),
                        sys.get_global_processor_info().get_cpu_usage(),
                        sys.get_used_memory(),
                        sys.get_components(),
                        now.format("%a %d %b %Y %l:%M:%S %p").to_string()
                    )
                    .ok();
                }
            }
            sys.refresh_networks();
            sys.refresh_cpu();
            sys.refresh_memory();
            sys.refresh_components();
            thread::sleep(instant);
        }
    } else {
        loop {
            now = now.add(chrono::Duration::seconds(1));
            for (interface_name, data) in sys.get_networks().iter() {
                if interface_name == "wls8" {
                    writeln!(
                        sout,
                        "%{{r}} [D:{} U:{}] [C:{}] [R:{}] [T:{:?}] [{}]",
                        data.get_received(),
                        data.get_transmitted(),
                        sys.get_global_processor_info().get_cpu_usage().ceil() as u8,
                        sys.get_used_memory(),
                        sys.get_components()
                            .iter()
                            .map(|x| x.get_temperature().ceil() as u8)
                            .max()
                            .unwrap_or(std::u8::MAX),
                        now.format("%a %d %b %Y %l:%M:%S %p").to_string()
                    )
                    .ok();
                }
            }

            sys.refresh_networks();
            sys.refresh_cpu();
            sys.refresh_memory();
            sys.refresh_components();
            thread::sleep(instant);
        }
    }
}
