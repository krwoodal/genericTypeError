# genericTypeError

## Instructions To Replicate Issue

1. Download the project or clone
2. Pods has been included in the project. Using `Realm` objects. If needed run `pod update` in project root folder
3. Build project for `GenericTypeError` Scheme (Notice that the project will compile fine)
4. Change scheme too `GenericTypeError_Release`
5. Build project (See below for error)
6. Comment out line 8 in `ViewController.swift` and uncomment line 11 in `ViewController.swift`
7. Rebuild project (Compiles Fine)

```
While emitting IR SIL function "@$s16GenericTypeError14ViewControllerC11viewDidLoadyyFTo".
for 'viewDidLoad()' (at /Users/kwoodall/Dropbox/Remind/Code/GenericTypeError/GenericTypeError/ViewController.swift:4:14)
0  swift                    0x000000010f73e4ea PrintStackTraceSignalHandler(void*) + 42
1  swift                    0x000000010f73dcc0 SignalHandler(int) + 352
2  libsystem_platform.dylib 0x00007fff683b75fd _sigtramp + 29
3  libsystem_platform.dylib 0x0000000110f1ba00 _sigtramp + 2830517280
4  swift                    0x000000010b508b50 swift::irgen::emitArchetypeWitnessTableRef(swift::irgen::IRGenFunction&, swift::CanTypeWrapper<swift::ArchetypeType>, swift::ProtocolDecl*) + 400
5  swift                    0x000000010b65a280 swift::irgen::emitGenericRequirementFromSubstitutions(swift::irgen::IRGenFunction&, swift::CanGenericSignature, swift::ModuleDecl&, swift::irgen::GenericRequirement, swift::SubstitutionMap) + 256
6  swift                    0x000000010b65a0e4 void llvm::function_ref<void (swift::irgen::GenericRequirement)>::callback_fn<(anonymous namespace)::EmitPolymorphicArguments::emit(swift::SubstitutionMap, swift::irgen::WitnessMetadata*, swift::irgen::Explosion&)::$_21>(long, swift::irgen::GenericRequirement) + 36
7  swift                    0x000000010b657e2d void llvm::function_ref<void (swift::irgen::GenericRequirement)>::callback_fn<(anonymous namespace)::PolymorphicConvention::enumerateUnfulfilledRequirements(llvm::function_ref<void (swift::irgen::GenericRequirement)> const&)::$_11>(long, swift::irgen::GenericRequirement) + 205
8  swift                    0x000000010b657d40 (anonymous namespace)::PolymorphicConvention::enumerateUnfulfilledRequirements(llvm::function_ref<void (swift::irgen::GenericRequirement)> const&) + 336
9  swift                    0x000000010b659e3e swift::irgen::emitPolymorphicArguments(swift::irgen::IRGenFunction&, swift::CanTypeWrapper<swift::SILFunctionType>, swift::SubstitutionMap, swift::irgen::WitnessMetadata*, swift::irgen::Explosion&) + 478
10 swift                    0x000000010b6e5167 (anonymous namespace)::IRGenSILFunction::visitFullApplySite(swift::FullApplySite) + 2263
11 swift                    0x000000010b6c58e3 swift::irgen::IRGenModule::emitSILFunction(swift::SILFunction*) + 8835
12 swift                    0x000000010b57bc46 swift::irgen::IRGenerator::emitLazyDefinitions() + 8790
13 swift                    0x000000010b6a1b2b swift::performIRGeneration(swift::IRGenOptions&, swift::ModuleDecl*, std::__1::unique_ptr<swift::SILModule, std::__1::default_delete<swift::SILModule> >, llvm::StringRef, swift::PrimarySpecificPaths const&, llvm::LLVMContext&, llvm::ArrayRef<std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > >, llvm::GlobalVariable**) + 1979
14 swift                    0x000000010b49b2f1 performCompileStepsPostSILGen(swift::CompilerInstance&, swift::CompilerInvocation&, std::__1::unique_ptr<swift::SILModule, std::__1::default_delete<swift::SILModule> >, bool, llvm::PointerUnion<swift::ModuleDecl*, swift::SourceFile*>, swift::PrimarySpecificPaths const&, bool, int&, swift::FrontendObserver*, swift::UnifiedStatsReporter*) + 4129
15 swift                    0x000000010b4924a5 swift::performFrontend(llvm::ArrayRef<char const*>, char const*, void*, swift::FrontendObserver*) + 55813
16 swift                    0x000000010b4084d3 main + 1283
17 libdyld.dylib            0x00007fff681becc9 start + 1
18 libdyld.dylib            0x0000000000000053 start + 2548306827
error: Segmentation fault: 11 (in target 'GenericTypeError' from project 'GenericTypeError')

```
