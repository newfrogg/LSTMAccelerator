/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2020 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
 #define IKI_DLLESPEC __declspec(dllimport)
#else
 #define IKI_DLLESPEC
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
IKI_DLLESPEC extern void execute_65(char*, char *);
IKI_DLLESPEC extern void execute_66(char*, char *);
IKI_DLLESPEC extern void execute_265(char*, char *);
IKI_DLLESPEC extern void execute_266(char*, char *);
IKI_DLLESPEC extern void execute_267(char*, char *);
IKI_DLLESPEC extern void execute_268(char*, char *);
IKI_DLLESPEC extern void execute_269(char*, char *);
IKI_DLLESPEC extern void execute_64(char*, char *);
IKI_DLLESPEC extern void vlog_simple_process_execute_0_fast_for_reg(char*, char*, char*);
IKI_DLLESPEC extern void execute_73(char*, char *);
IKI_DLLESPEC extern void execute_74(char*, char *);
IKI_DLLESPEC extern void execute_75(char*, char *);
IKI_DLLESPEC extern void execute_76(char*, char *);
IKI_DLLESPEC extern void execute_77(char*, char *);
IKI_DLLESPEC extern void execute_78(char*, char *);
IKI_DLLESPEC extern void execute_79(char*, char *);
IKI_DLLESPEC extern void execute_83(char*, char *);
IKI_DLLESPEC extern void execute_85(char*, char *);
IKI_DLLESPEC extern void execute_86(char*, char *);
IKI_DLLESPEC extern void execute_87(char*, char *);
IKI_DLLESPEC extern void execute_88(char*, char *);
IKI_DLLESPEC extern void execute_89(char*, char *);
IKI_DLLESPEC extern void execute_90(char*, char *);
IKI_DLLESPEC extern void execute_91(char*, char *);
IKI_DLLESPEC extern void execute_92(char*, char *);
IKI_DLLESPEC extern void execute_95(char*, char *);
IKI_DLLESPEC extern void execute_96(char*, char *);
IKI_DLLESPEC extern void execute_98(char*, char *);
IKI_DLLESPEC extern void execute_99(char*, char *);
IKI_DLLESPEC extern void execute_100(char*, char *);
IKI_DLLESPEC extern void execute_101(char*, char *);
IKI_DLLESPEC extern void execute_107(char*, char *);
IKI_DLLESPEC extern void execute_110(char*, char *);
IKI_DLLESPEC extern void execute_111(char*, char *);
IKI_DLLESPEC extern void execute_112(char*, char *);
IKI_DLLESPEC extern void execute_113(char*, char *);
IKI_DLLESPEC extern void execute_114(char*, char *);
IKI_DLLESPEC extern void execute_115(char*, char *);
IKI_DLLESPEC extern void execute_116(char*, char *);
IKI_DLLESPEC extern void execute_117(char*, char *);
IKI_DLLESPEC extern void execute_118(char*, char *);
IKI_DLLESPEC extern void execute_119(char*, char *);
IKI_DLLESPEC extern void execute_120(char*, char *);
IKI_DLLESPEC extern void execute_121(char*, char *);
IKI_DLLESPEC extern void execute_122(char*, char *);
IKI_DLLESPEC extern void execute_123(char*, char *);
IKI_DLLESPEC extern void execute_124(char*, char *);
IKI_DLLESPEC extern void execute_125(char*, char *);
IKI_DLLESPEC extern void execute_126(char*, char *);
IKI_DLLESPEC extern void execute_127(char*, char *);
IKI_DLLESPEC extern void execute_128(char*, char *);
IKI_DLLESPEC extern void execute_129(char*, char *);
IKI_DLLESPEC extern void execute_130(char*, char *);
IKI_DLLESPEC extern void execute_131(char*, char *);
IKI_DLLESPEC extern void execute_132(char*, char *);
IKI_DLLESPEC extern void execute_217(char*, char *);
IKI_DLLESPEC extern void execute_218(char*, char *);
IKI_DLLESPEC extern void execute_219(char*, char *);
IKI_DLLESPEC extern void execute_220(char*, char *);
IKI_DLLESPEC extern void execute_221(char*, char *);
IKI_DLLESPEC extern void execute_222(char*, char *);
IKI_DLLESPEC extern void execute_223(char*, char *);
IKI_DLLESPEC extern void execute_224(char*, char *);
IKI_DLLESPEC extern void execute_225(char*, char *);
IKI_DLLESPEC extern void execute_226(char*, char *);
IKI_DLLESPEC extern void execute_227(char*, char *);
IKI_DLLESPEC extern void execute_228(char*, char *);
IKI_DLLESPEC extern void execute_229(char*, char *);
IKI_DLLESPEC extern void execute_230(char*, char *);
IKI_DLLESPEC extern void execute_231(char*, char *);
IKI_DLLESPEC extern void execute_232(char*, char *);
IKI_DLLESPEC extern void execute_233(char*, char *);
IKI_DLLESPEC extern void execute_234(char*, char *);
IKI_DLLESPEC extern void execute_235(char*, char *);
IKI_DLLESPEC extern void execute_236(char*, char *);
IKI_DLLESPEC extern void execute_237(char*, char *);
IKI_DLLESPEC extern void execute_238(char*, char *);
IKI_DLLESPEC extern void execute_239(char*, char *);
IKI_DLLESPEC extern void execute_240(char*, char *);
IKI_DLLESPEC extern void execute_241(char*, char *);
IKI_DLLESPEC extern void execute_242(char*, char *);
IKI_DLLESPEC extern void execute_243(char*, char *);
IKI_DLLESPEC extern void execute_244(char*, char *);
IKI_DLLESPEC extern void execute_245(char*, char *);
IKI_DLLESPEC extern void execute_246(char*, char *);
IKI_DLLESPEC extern void execute_247(char*, char *);
IKI_DLLESPEC extern void execute_248(char*, char *);
IKI_DLLESPEC extern void execute_249(char*, char *);
IKI_DLLESPEC extern void execute_250(char*, char *);
IKI_DLLESPEC extern void execute_251(char*, char *);
IKI_DLLESPEC extern void execute_252(char*, char *);
IKI_DLLESPEC extern void execute_253(char*, char *);
IKI_DLLESPEC extern void execute_254(char*, char *);
IKI_DLLESPEC extern void execute_255(char*, char *);
IKI_DLLESPEC extern void execute_256(char*, char *);
IKI_DLLESPEC extern void execute_257(char*, char *);
IKI_DLLESPEC extern void execute_258(char*, char *);
IKI_DLLESPEC extern void execute_259(char*, char *);
IKI_DLLESPEC extern void execute_260(char*, char *);
IKI_DLLESPEC extern void execute_261(char*, char *);
IKI_DLLESPEC extern void execute_262(char*, char *);
IKI_DLLESPEC extern void execute_263(char*, char *);
IKI_DLLESPEC extern void execute_264(char*, char *);
IKI_DLLESPEC extern void execute_27(char*, char *);
IKI_DLLESPEC extern void execute_136(char*, char *);
IKI_DLLESPEC extern void execute_137(char*, char *);
IKI_DLLESPEC extern void execute_138(char*, char *);
IKI_DLLESPEC extern void execute_139(char*, char *);
IKI_DLLESPEC extern void execute_140(char*, char *);
IKI_DLLESPEC extern void execute_141(char*, char *);
IKI_DLLESPEC extern void execute_142(char*, char *);
IKI_DLLESPEC extern void execute_143(char*, char *);
IKI_DLLESPEC extern void execute_144(char*, char *);
IKI_DLLESPEC extern void execute_145(char*, char *);
IKI_DLLESPEC extern void execute_146(char*, char *);
IKI_DLLESPEC extern void execute_147(char*, char *);
IKI_DLLESPEC extern void execute_148(char*, char *);
IKI_DLLESPEC extern void execute_149(char*, char *);
IKI_DLLESPEC extern void execute_150(char*, char *);
IKI_DLLESPEC extern void execute_151(char*, char *);
IKI_DLLESPEC extern void execute_152(char*, char *);
IKI_DLLESPEC extern void execute_153(char*, char *);
IKI_DLLESPEC extern void execute_18(char*, char *);
IKI_DLLESPEC extern void execute_20(char*, char *);
IKI_DLLESPEC extern void execute_22(char*, char *);
IKI_DLLESPEC extern void execute_24(char*, char *);
IKI_DLLESPEC extern void execute_134(char*, char *);
IKI_DLLESPEC extern void execute_26(char*, char *);
IKI_DLLESPEC extern void execute_135(char*, char *);
IKI_DLLESPEC extern void execute_68(char*, char *);
IKI_DLLESPEC extern void execute_69(char*, char *);
IKI_DLLESPEC extern void execute_70(char*, char *);
IKI_DLLESPEC extern void execute_71(char*, char *);
IKI_DLLESPEC extern void execute_270(char*, char *);
IKI_DLLESPEC extern void execute_271(char*, char *);
IKI_DLLESPEC extern void execute_272(char*, char *);
IKI_DLLESPEC extern void execute_273(char*, char *);
IKI_DLLESPEC extern void execute_274(char*, char *);
IKI_DLLESPEC extern void execute_275(char*, char *);
IKI_DLLESPEC extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[140] = {(funcp)execute_65, (funcp)execute_66, (funcp)execute_265, (funcp)execute_266, (funcp)execute_267, (funcp)execute_268, (funcp)execute_269, (funcp)execute_64, (funcp)vlog_simple_process_execute_0_fast_for_reg, (funcp)execute_73, (funcp)execute_74, (funcp)execute_75, (funcp)execute_76, (funcp)execute_77, (funcp)execute_78, (funcp)execute_79, (funcp)execute_83, (funcp)execute_85, (funcp)execute_86, (funcp)execute_87, (funcp)execute_88, (funcp)execute_89, (funcp)execute_90, (funcp)execute_91, (funcp)execute_92, (funcp)execute_95, (funcp)execute_96, (funcp)execute_98, (funcp)execute_99, (funcp)execute_100, (funcp)execute_101, (funcp)execute_107, (funcp)execute_110, (funcp)execute_111, (funcp)execute_112, (funcp)execute_113, (funcp)execute_114, (funcp)execute_115, (funcp)execute_116, (funcp)execute_117, (funcp)execute_118, (funcp)execute_119, (funcp)execute_120, (funcp)execute_121, (funcp)execute_122, (funcp)execute_123, (funcp)execute_124, (funcp)execute_125, (funcp)execute_126, (funcp)execute_127, (funcp)execute_128, (funcp)execute_129, (funcp)execute_130, (funcp)execute_131, (funcp)execute_132, (funcp)execute_217, (funcp)execute_218, (funcp)execute_219, (funcp)execute_220, (funcp)execute_221, (funcp)execute_222, (funcp)execute_223, (funcp)execute_224, (funcp)execute_225, (funcp)execute_226, (funcp)execute_227, (funcp)execute_228, (funcp)execute_229, (funcp)execute_230, (funcp)execute_231, (funcp)execute_232, (funcp)execute_233, (funcp)execute_234, (funcp)execute_235, (funcp)execute_236, (funcp)execute_237, (funcp)execute_238, (funcp)execute_239, (funcp)execute_240, (funcp)execute_241, (funcp)execute_242, (funcp)execute_243, (funcp)execute_244, (funcp)execute_245, (funcp)execute_246, (funcp)execute_247, (funcp)execute_248, (funcp)execute_249, (funcp)execute_250, (funcp)execute_251, (funcp)execute_252, (funcp)execute_253, (funcp)execute_254, (funcp)execute_255, (funcp)execute_256, (funcp)execute_257, (funcp)execute_258, (funcp)execute_259, (funcp)execute_260, (funcp)execute_261, (funcp)execute_262, (funcp)execute_263, (funcp)execute_264, (funcp)execute_27, (funcp)execute_136, (funcp)execute_137, (funcp)execute_138, (funcp)execute_139, (funcp)execute_140, (funcp)execute_141, (funcp)execute_142, (funcp)execute_143, (funcp)execute_144, (funcp)execute_145, (funcp)execute_146, (funcp)execute_147, (funcp)execute_148, (funcp)execute_149, (funcp)execute_150, (funcp)execute_151, (funcp)execute_152, (funcp)execute_153, (funcp)execute_18, (funcp)execute_20, (funcp)execute_22, (funcp)execute_24, (funcp)execute_134, (funcp)execute_26, (funcp)execute_135, (funcp)execute_68, (funcp)execute_69, (funcp)execute_70, (funcp)execute_71, (funcp)execute_270, (funcp)execute_271, (funcp)execute_272, (funcp)execute_273, (funcp)execute_274, (funcp)execute_275, (funcp)vlog_transfunc_eventcallback};
const int NumRelocateId= 140;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/tb_accelerator_real_data_behav/xsim.reloc",  (void **)funcTab, 140);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/tb_accelerator_real_data_behav/xsim.reloc");
}

void simulate(char *dp)
{
iki_register_root_pointers(5, 49072, 4,0,0,48888, 3,0,0,48704, 2,0,0,48520, 0,0,0,48336, -5,0) ; 
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/tb_accelerator_real_data_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void subprog_m_6543a0ac6549ae28_40c5fc66_3() ;
void subprog_m_6543a0ac6549ae28_40c5fc66_2() ;
void subprog_m_6543a0ac6549ae28_40c5fc66_1() ;
void subprog_m_6543a0ac6549ae28_40c5fc66_6() ;
void subprog_m_6543a0ac6549ae28_40c5fc66_5() ;
void subprog_m_6543a0ac6549ae28_40c5fc66_4() ;
void subprog_m_6543a0ac6549ae28_40c5fc66_9() ;
void subprog_m_6543a0ac6549ae28_40c5fc66_8() ;
void subprog_m_6543a0ac6549ae28_40c5fc66_7() ;
void subprog_m_6543a0ac6549ae28_40c5fc66_12() ;
void subprog_m_6543a0ac6549ae28_40c5fc66_11() ;
void subprog_m_6543a0ac6549ae28_40c5fc66_10() ;
static char* ng00[] = {(void *)subprog_m_6543a0ac6549ae28_40c5fc66_3, (void *)subprog_m_6543a0ac6549ae28_40c5fc66_2, (void *)subprog_m_6543a0ac6549ae28_40c5fc66_1};
static char* ng20[] = {(void *)subprog_m_6543a0ac6549ae28_40c5fc66_6, (void *)subprog_m_6543a0ac6549ae28_40c5fc66_5, (void *)subprog_m_6543a0ac6549ae28_40c5fc66_4};
static char* ng30[] = {(void *)subprog_m_6543a0ac6549ae28_40c5fc66_9, (void *)subprog_m_6543a0ac6549ae28_40c5fc66_8, (void *)subprog_m_6543a0ac6549ae28_40c5fc66_7};
static char* ng40[] = {(void *)subprog_m_6543a0ac6549ae28_40c5fc66_12, (void *)subprog_m_6543a0ac6549ae28_40c5fc66_11, (void *)subprog_m_6543a0ac6549ae28_40c5fc66_10};
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_xsimdir_location_if_remapped(argc, argv)  ;
    iki_set_sv_type_file_path_name("xsim.dir/tb_accelerator_real_data_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/tb_accelerator_real_data_behav/xsim.crvsdump");
    iki_svlog_initialize_virtual_tables(4, 0, ng00, 2, ng20, 3, ng30, 4, ng40);
    void* design_handle = iki_create_design("xsim.dir/tb_accelerator_real_data_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, (void*)0, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
