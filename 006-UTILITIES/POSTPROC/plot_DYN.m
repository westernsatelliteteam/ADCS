function plot_DYN(simOut, TimeScaler, CONSTANTS_par, resultsdir, plots2Gen)
  
  
  mkdir([resultsdir,'/DYN'])
  %% unpack simOut for plotting
  
  %   OUT_BOFq_ECI_diff                   = simOut.get('OUT_BOFq_ECI_diff');
  %   OUT_P_est                           = simOut.get('OUT_P_est');
  %   OUT_BOFrpy_ECI_deg                  = simOut.get('OUT_BOFrpy_ECI_deg');
  %   OUT_BOFrpy_ECI_est_deg              = simOut.get('OUT_BOFrpy_ECI_est_deg');
  %   OUT_BOFq_ECI_rotdiff                = simOut.get('OUT_BOFq_ECI_rotdiff');
  
  OUT_pos_ECI                         = simOut.get('OUT_pos_ECI');
  OUT_vel_ECI                         = simOut.get('OUT_vel_ECI');
  OUT_grvtor_BOF                      = simOut.get('OUT_grvtor_BOF');
  
  %   OUT_magtorpert_BOF                  = simOut.get('OUT_magtorpert_BOF');
  %   OUT_SCcom_MEC                       = simOut.get('OUT_SCcom_MEC');
  %   OUT_pos_BOF                         = simOut.get('OUT_pos_BOF');
  %   OUT_extfor_ECI                      = simOut.get('OUT_extfor_ECI');
  %   OUT_SCmass                          = simOut.get('OUT_SCmass');
  %   OUT_QRBq_ECI                        = simOut.get('OUT_QRBq_ECI');
  %   OUT_grvtor_ORB                      = simOut.get('OUT_grvtor_ORB');
  %   OUT_BOFw_relECI_ORB                 = simOut.get('OUT_BOFw_relECI_ORB');
  OUT_acc_ECI                         = simOut.get('OUT_acc_ECI');
  OUT_BOFrpy_QRB                      = simOut.get('OUT_BOFrpy_QRB');
  OUT_magtor_BOF                      = simOut.get('OUT_magtor_BOF');
  OUT_exttor_BOF                      = simOut.get('OUT_exttor_BOF');
  OUT_magfld_BOF                      = simOut.get('OUT_magfld_BOF');
  OUT_magfld_TER                      = simOut.get('OUT_magfld_TER');
  OUT_grvacc_pert_TER                 = simOut.get('OUT_grvacc_pert_TER');
  %   OUT_grvacc_TER                      = simOut.get('OUT_grvacc_TER');
  %   OUT_grvacc_ECI                      = simOut.get('OUT_grvacc_ECI');
  %   OUT_pos_TER                         = simOut.get('OUT_pos_TER');
  OUT_BOFrpy_ORB                      = simOut.get('OUT_BOFrpy_ORB');
  OUT_BOFq_ECI                        = simOut.get('OUT_BOFq_ECI');
  %   OUT_BOFrpy_ECI                      = simOut.get('OUT_BOFrpy_ECI');
  OUT_ORBz_angdif                     = simOut.get('OUT_ORBz_angdif');
  %   OUT_BOFq_QRB                        = simOut.get('OUT_BOFq_QRB');
  OUT_BOFq_ORB                        = simOut.get('OUT_BOFq_ORB');
  %   OUT_MOONpos_ECI                     = simOut.get('OUT_MOONpos_ECI');
  %   OUT_SUNpos_ECI                      = simOut.get('OUT_SUNpos_ECI');
  %   OUT_TERw_ECI                        = simOut.get('OUT_TERw_ECI');
  %   OUT_TERq_ECI                        = simOut.get('OUT_TERq_ECI');
  %   OUT_drgfor_ECI                      = simOut.get('OUT_drgfor_ECI');
  OUT_drgtor_BOF                      = simOut.get('OUT_drgtor_BOF');
  OUT_BOFw_relECI_BOF                 = simOut.get('OUT_BOFw_relECI_BOF');
  OUT_BOFw_relORB_BOF                 = simOut.get('OUT_BOFw_relORB_BOF');
  %   OUT_drgfor_MEC                      = simOut.get('OUT_drgfor_MEC');
  %   OUT_drgfor_MEC_array                = simOut.get('OUT_drgfor_MEC_array');
  %   OUT_drgtor_MEC_array                = simOut.get('OUT_drgtor_MEC_array');
  %   OUT_SCvel_relATM_ECI                = simOut.get('OUT_SCvel_relATM_ECI');
  %   OUT_SCvel_relATM_BOF                = simOut.get('OUT_SCvel_relATM_BOF');
  %   OUT_atmdensity                      = simOut.get('OUT_atmdensity');
  OUT_eclipseflg                      = simOut.get('OUT_eclipseflg');
  %   OUT_time_TAI_secofday               = simOut.get('OUT_time_TAI_secofday');
  %   OUT_time_TAI_dayofyear              = simOut.get('OUT_time_TAI_dayofyear');
  %   OUT_time_TAI_secofmin               = simOut.get('OUT_time_TAI_secofmin');
  %   OUT_time_TAI_minofhr                = simOut.get('OUT_time_TAI_minofhr');
  %   OUT_time_TAI_hrofday                = simOut.get('OUT_time_TAI_hrofday');
  %   OUT_time_TAI_dayofmonth             = simOut.get('OUT_time_TAI_dayofmonth');
  %   OUT_time_TAI_monthofyear            = simOut.get('OUT_time_TAI_monthofyear');
  %   OUT_time_relCEepoch_TAI_wholeyears  = simOut.get('OUT_time_relCEepoch_TAI_wholeyears');
  %   OUT_time_relJDepoch_TAI_days        = simOut.get('OUT_time_relJDepoch_TAI_days');
  OUT_magfld_ORB                      = simOut.get('OUT_magfld_ORB');
  OUT_extacc_ECI                      = simOut.get('OUT_extacc_ECI');
  %   OUT_htot_BOF                        = simOut.get('OUT_htot_BOF');
  %   OUT_hsc_BOF                         = simOut.get('OUT_hsc_BOF');
  %   OUT_SCinertia_BOF                   = simOut.get('OUT_SCinertia_BOF');
  OUT_grvacc_pointmass_TER            = simOut.get('OUT_grvacc_pointmass_TER');
 
  
  OUT_magmomapp_BOF       = simOut.get('OUT_magmomapp_BOF');
  
  %% Plot 1 Inital Conditions Summary [ECI]
  if any(plots2Gen == 1)
    fig_name= 'DYN1- Inital Conditions Summary [ECI]';
    clear ax
    
    SCpos_ECI_uvec  = vecunit3d(OUT_pos_ECI.signals.values(1,:)');
    SCvel_ECI_uvec  = vecunit3d(OUT_vel_ECI.signals.values(1,:)');
    [ORB_ECI_ini]   = rv2orb(OUT_pos_ECI.signals.values(1,:)',OUT_vel_ECI.signals.values(1,:)',0);
    ORBx_ECI_ini    = ORB_ECI_ini(1,:);
    % ORBy_ECI_ini    = ORB_ECI_ini(2,:);
    ORBz_ECI_ini    = ORB_ECI_ini(3,:);
    BOF_ECI         = q2dcm(OUT_BOFq_ORB.signals.values(1,:)');
    
    fighandle = figure('Name', fig_name);
    plot3([0,BOF_ECI(1,1)],[0,BOF_ECI(1,2)],[0,BOF_ECI(1,3)],'-gx')
    hold on
    plot3([0,BOF_ECI(2,1)],[0,BOF_ECI(2,2)],[0,BOF_ECI(2,3)],'--gx')
    plot3([0,BOF_ECI(3,1)],[0,BOF_ECI(3,2)],[0,BOF_ECI(3,3)],'-.gx')
    
    plot3([0,SCpos_ECI_uvec(1)],[0,SCpos_ECI_uvec(2)],[0,SCpos_ECI_uvec(3)],'-sr')
    plot3([0,SCvel_ECI_uvec(1)],[0,SCvel_ECI_uvec(2)],[0,SCvel_ECI_uvec(3)],'--sr')
    
    plot3([0,ORBx_ECI_ini(1)],[0,ORBx_ECI_ini(2)],[0,ORBx_ECI_ini(3)],'-db')
    plot3([0,ORBz_ECI_ini(1)],[0,ORBz_ECI_ini(2)],[0,ORBz_ECI_ini(3)],'-.db')
    
    % label tips of vectors
    text(BOF_ECI(1,1),BOF_ECI(1,2),BOF_ECI(1,3),'BOFx')
    text(BOF_ECI(2,1),BOF_ECI(2,2),BOF_ECI(2,3),'BOFy')
    text(SCvel_ECI_uvec(1),SCvel_ECI_uvec(2),SCvel_ECI_uvec(3),'SCvel\_uvec')
    
    % vectors that could be coincident may need a different label to avoid
    % overlap
    check=vecangdiff([BOF_ECI(3,1),BOF_ECI(3,2),BOF_ECI(3,3)],ORBz_ECI_ini);
    if check < 10*pi/180
      text(BOF_ECI(3,1),BOF_ECI(3,2),BOF_ECI(3,3),'BOFz & ORBz')
    else
      text(BOF_ECI(3,1),BOF_ECI(3,2),BOF_ECI(3,3),'BOFz')
      text(ORBz_ECI_ini(1),ORBz_ECI_ini(2),ORBz_ECI_ini(3),'ORBz')
    end
    
    check=vecangdiff(SCpos_ECI_uvec(:),ORBx_ECI_ini(:));
    if check < 10*pi/180
      text(ORBx_ECI_ini(1),ORBx_ECI_ini(2),ORBx_ECI_ini(3),'ORBx & SCpos\_uvec')
    else
      text(SCpos_ECI_uvec(1),SCpos_ECI_uvec(2),SCpos_ECI_uvec(3),'SCpos\_uvec')
      text(ORBx_ECI_ini(1),ORBx_ECI_ini(2),ORBx_ECI_ini(3),'ORBx')
    end
    
    legend('BOFx\_ECI','BOFy\_ECI','BOFz\_ECI','SCpos\_ECI','SCvel\_ECI','ORBx\_ECI','ORBz\_ECI')
    axis equal
    xlim([-1.5,1.5])
    ylim([-1.5,1.5])
    zlim([-1.5,1.5])
    grid on
    xlabel('X_E_C_I')
    ylabel('Y_E_C_I')
    zlabel('Z_E_C_I')
    title(fig_name)
    saveas(fighandle,[resultsdir, '/DYN/', fig_name,'.fig'])
    close (fighandle)
  end
  
  %% Plot 3D Orbit track
  if any(plots2Gen == 2)
    fig_name= 'DYN2- 3D Orbit track';
    fighandle = figure('Name', fig_name);
    clear ax
    
    % dummy earth
    [X, Y, Z] = sphere(20);
    X = X * 6387.15*1000;
    Y = Y * 6387.15*1000;
    Z = Z * 6387.15*1000;
    title(fig_name)
    plot3(OUT_pos_ECI.signals.values(1,1),OUT_pos_ECI.signals.values(1,2),OUT_pos_ECI.signals.values(1,3), 'mx', 'linewidth',5)
    hold on
    plot3(OUT_pos_ECI.signals.values(:,1),OUT_pos_ECI.signals.values(:,2),OUT_pos_ECI.signals.values(:,3), ':k', 'linewidth',2)
    surf(X, Y, Z)
    
    xlabel('X_E_C_I')
    ylabel('Y_E_C_I')
    zlabel('Z_E_C_I')
    legend('Initial Position','Orbit Track', 'Earth');
    axis equal
    saveas(fighandle,[resultsdir, '/DYN/', fig_name,'.fig'])
    close (fighandle)
  end
  %% Orbit Summary
  
  if any(plots2Gen == 3)
    fig_name= 'DYN3- Orbit Summary';
    fighandle = figure('Name', fig_name);
    clear ax
    
    ax(1)=subplot (4,1,1);
    plot(OUT_pos_ECI.time * TimeScaler,OUT_pos_ECI.signals.values/1000)
    ylabel('[km]')
    title({fig_name; 'Position (ECI)'})
    
    ax(2)=subplot (4,1,2);
    plot(OUT_vel_ECI.time * TimeScaler,OUT_vel_ECI.signals.values/1000)
    ylabel('[km/s]')
    title('Velocity (ECI)')
    
    ax(3)=subplot (4,1,3);
    plot(OUT_acc_ECI.time * TimeScaler,OUT_acc_ECI.signals.values)
    ylabel('[m/s/s]')
    title('Acceleration (ECI)')
    
    ax(4)=subplot (4,1,4);
    plot(OUT_extacc_ECI.time * TimeScaler,OUT_extacc_ECI.signals.values)
    ylabel('[m/s/s]')
    title('External Acceleration (ECI)')
    xlabel('Orbits [-]')
    linkaxes(ax, 'x')
    %set(fighandle,'renderer','painters')
    saveas(fighandle,[resultsdir, '/DYN/', fig_name,'.fig'])
    close (fighandle)
  end
  %% Orbit Summary
  if any(plots2Gen == 4)
    fig_name= 'DYN4- Acceleration sources summary';
    fighandle = figure('Name', fig_name);
    clear ax
    
    ax(1)=subplot (4,1,1);
    plot(OUT_acc_ECI.time * TimeScaler,OUT_acc_ECI.signals.values)
    ylabel({'[m/s/s]'})
    title({fig_name;'Total Accleration (ECI)'})
    
    ax(2)=subplot (4,1,2);
    plot(OUT_grvacc_pointmass_TER.time * TimeScaler,OUT_grvacc_pointmass_TER.signals.values)
    ylabel({'[m/s/s]'})
    title (' Acceleration from Pointmass Gravity (TER)')
    
    ax(3)=subplot (4,1,3);
    plot(OUT_grvacc_pert_TER.time * TimeScaler,OUT_grvacc_pert_TER.signals.values)
    ylabel({'[m/s/s]'})
    title (' Acceleration from Gravity Perturbation (TER)')
    
    ax(4)=subplot (4,1,4);
    plot(OUT_extacc_ECI.time * TimeScaler,OUT_extacc_ECI.signals.values)
    ylabel({'[m/s/s]'})
    title (' Acceleration from external forces (ECI)')
    xlabel('Orbits [-]')
    linkaxes(ax, 'x')
    %set(fighandle,'renderer','painters')
    % saveas(fighandle,[fig_name,'.fig'])
    saveas(fighandle,[resultsdir, '/DYN/',fig_name,'.fig'])
    close (fighandle)
  end
  
  %% Attitude Summary
  if any(plots2Gen == 5)
    fig_name= 'DYN5- Attitude summary - BOF to ECI';
    fighandle = figure('Name', fig_name);
    clear ax
    
    ax(1)=subplot (3,1,1);
    plot(OUT_BOFq_ECI.time * TimeScaler, OUT_BOFq_ECI.signals.values(:,1), '-')
    hold on
    plot(OUT_BOFq_ECI.time * TimeScaler, OUT_BOFq_ECI.signals.values(:,2),'--')
    plot(OUT_BOFq_ECI.time * TimeScaler, OUT_BOFq_ECI.signals.values(:,3),'-.')
    plot(OUT_BOFq_ECI.time * TimeScaler, OUT_BOFq_ECI.signals.values(:,4),':')
    ylabel('[-]')
    title({fig_name,'BOFq\_ECI'})
    legend ('\eta','\epsilon_x','\epsilon_y','\epsilon_z', 'Location','northeastoutside')
    
    ax(2)=subplot (3,1,2);
    plot(OUT_BOFw_relECI_BOF.time * TimeScaler, OUT_BOFw_relECI_BOF.signals.values(:,1), '-')
    hold on
    plot(OUT_BOFw_relECI_BOF.time * TimeScaler, OUT_BOFw_relECI_BOF.signals.values(:,2),'--')
    plot(OUT_BOFw_relECI_BOF.time * TimeScaler, OUT_BOFw_relECI_BOF.signals.values(:,3),'-.')
    ylabel('[rad/s]')
    title('BOFw\_relECI\_BOF')
    legend ('\omega_x','\omega_y','\omega_z', 'Location','northeastoutside')
    
    ax(3)=subplot (3,1,3);
    plot(OUT_exttor_BOF.time * TimeScaler, squeeze(OUT_exttor_BOF.signals.values(:,1)), '-')
    hold on
    plot(OUT_exttor_BOF.time * TimeScaler, squeeze(OUT_exttor_BOF.signals.values(:,2)),'--')
    plot(OUT_exttor_BOF.time * TimeScaler, squeeze(OUT_exttor_BOF.signals.values(:,3)),'-.')
    ylabel('[Nm]')
    xlabel('Orbits [-]')
    legend ('\tau_x','\tau_y','\tau_z', 'Location','northeastoutside')
    title('OUT\_exttor\_BOF')
    linkaxes(ax, 'x')
    xlabel('Orbits [-]')
    %set(fighandle,'renderer','painters')
    saveas(fighandle,[resultsdir, '/DYN/',fig_name,'.fig'])
    close (fighandle)
  end
  
  %% Attitude Summary
  if any(plots2Gen == 6)
    fig_name= 'DYN6- Attitude summary - BOF to ORB';
    fighandle = figure('Name', fig_name);
    clear ax
    
    ax(1)=subplot (4,1,1);
    plot(OUT_BOFq_ORB.time * TimeScaler, OUT_BOFq_ORB.signals.values(:,1),'-')
    hold on
    plot(OUT_BOFq_ORB.time * TimeScaler, OUT_BOFq_ORB.signals.values(:,2),'--')
    plot(OUT_BOFq_ORB.time * TimeScaler, OUT_BOFq_ORB.signals.values(:,3),'-.')
    plot(OUT_BOFq_ORB.time * TimeScaler, OUT_BOFq_ORB.signals.values(:,4),':')
    ylabel('[-]')
    title({fig_name; 'BOFq\_ORB'})
    % legend ('qw', 'qx', 'qy', 'qz')
    legend ('\eta','\epsilon_x','\epsilon_y','\epsilon_z')
    
    ax(2)=subplot (4,1,2);
    plot(OUT_BOFw_relECI_BOF.time * TimeScaler, (OUT_BOFw_relECI_BOF.signals.values) * CONSTANTS_par.rad2deg)
    ylabel({ '[deg/s]'})
    title('BOFw\_relECI\_BOF')
    legend('x component', 'y component', 'z component')
    
    ax(3)=subplot (4,1,3);
    plot(OUT_ORBz_angdif.time * TimeScaler, OUT_ORBz_angdif.signals.values)
    ylabel({ '[deg]'})
    title ('Angle betwen ORBx\_BOF & ORBx\_BOF\_nom')
    
    ax(4)=subplot (4,1,4);
    plot(OUT_exttor_BOF.time * TimeScaler, squeeze(OUT_exttor_BOF.signals.values))
    ylabel({ '[Nm]'})
    title('External Torque (BOF)')
    legend('x component', 'y component', 'z component')
    xlabel('Orbits [-]')
    linkaxes(ax, 'x')
    saveas(fighandle,[resultsdir, '/DYN/',fig_name,'.fig'])
    close (fighandle)
  end
  
  %%   Attitude RPY - ORB
  if any(plots2Gen == 7)
    fig_name= 'DYN7- Attitude RPY - ORB';
    fighandle = figure('Name', fig_name);
    clear ax
    
    ax(1)=subplot (2,1,1);
    plot(OUT_BOFrpy_ORB.time* TimeScaler, OUT_BOFrpy_ORB.signals.values)
    ylabel('BOFq\_ORB, [deg]')
    legend ('roll', 'pitch', 'yaw')
    
    ax(2)=subplot (2,1,2);
    plot(OUT_BOFrpy_QRB.time* TimeScaler, OUT_BOFrpy_QRB.signals.values)
    ylabel('BOFq\_QRB, [deg]')
    xlabel('Orbits [-]')
    linkaxes(ax, 'x')
    saveas(fighandle,[resultsdir, '/DYN/',fig_name,'.fig'])
    close (fighandle)
  end
  
  %% Mag Field
  if any(plots2Gen == 8)
    fig_name= 'DYN8- Magnetic Field';
    fighandle = figure('Name', fig_name);
    clear ax
    ax(1)=subplot (3,1,1);
    %     T2gauss = 10000;
    plot(OUT_magfld_BOF.time* TimeScaler, OUT_magfld_BOF.signals.values)
    ylabel('magfld\_BOF, [T]')
    ax(2)=subplot (3,1,2);
    plot(OUT_magfld_TER.time* TimeScaler, OUT_magfld_TER.signals.values)
    ylabel('magfld\_TER, [T]')
    ax(2)=subplot (3,1,3);
    plot(OUT_magfld_ORB.time* TimeScaler, OUT_magfld_ORB.signals.values)
    hold on
    magfld_ORB_meanval = mean(OUT_magfld_ORB.signals.values(:,:));
    magfld_ORB_meanvec = repmat(magfld_ORB_meanval,numel(OUT_magfld_ORB.time),1);
    plot(OUT_magfld_ORB.time* TimeScaler, magfld_ORB_meanvec ,':')
    ylabel('magfld\_ORB, [T]')
    xlabel('Orbits [-]')
    linkaxes(ax, 'x')
    %set(fighandle,'renderer','painters')
    saveas(fighandle,[resultsdir, '/DYN/',fig_name,'.fig'])
    close (fighandle)
  end
  
  %% Attitude Summary
  if any(plots2Gen == 9)
    fig_name= 'DYN9- Torque Summary - BOF';
    fighandle = figure('Name', fig_name);
    clear ax
    
    ax(1)=subplot (4,1,1);
    plot(OUT_exttor_BOF.time * TimeScaler, squeeze(OUT_exttor_BOF.signals.values(:,1)),'-')
    hold on
    plot(OUT_exttor_BOF.time * TimeScaler, squeeze(OUT_exttor_BOF.signals.values(:,2)),'--')
    plot(OUT_exttor_BOF.time * TimeScaler, squeeze(OUT_exttor_BOF.signals.values(:,3)),'-.')
    ylabel({ '[Nm]'})
    title({fig_name;'External Torque (BOF)'})
    
    ax(2)=subplot (4,1,2);
    plot(OUT_grvtor_BOF.time* TimeScaler, OUT_grvtor_BOF.signals.values(:,1),'-')
    hold on
    plot(OUT_grvtor_BOF.time* TimeScaler, OUT_grvtor_BOF.signals.values(:,2),'--')
    plot(OUT_grvtor_BOF.time* TimeScaler, OUT_grvtor_BOF.signals.values(:,3),'-.')
    ylabel({ '[Nm]'})
    title ('Gravity Gradient Torque (BOF)')
    
    ax(3)=subplot (4,1,3);
    plot(OUT_magtor_BOF.time* TimeScaler, OUT_magtor_BOF.signals.values(:,1),'-')
    hold on
    plot(OUT_magtor_BOF.time* TimeScaler, OUT_magtor_BOF.signals.values(:,2),'--')
    plot(OUT_magtor_BOF.time* TimeScaler, OUT_magtor_BOF.signals.values(:,3),'-.')
    ylabel('[Nm]')
    title ('Magnetic Torque (BOF)')
    
    ax(4)=subplot (4,1,4);
    plot(OUT_drgtor_BOF.time* TimeScaler, OUT_drgtor_BOF.signals.values(:,1),'-')
    hold on
    plot(OUT_drgtor_BOF.time* TimeScaler, OUT_drgtor_BOF.signals.values(:,2),'--')
    plot(OUT_drgtor_BOF.time* TimeScaler, OUT_drgtor_BOF.signals.values(:,3),'-.')
    ylabel('[Nm]')
    title ('Drag Torque (BOF)')
    
    % ax(5)=subplot (5,1,);
    % % plot(OUT_tor_BOF_ideal.time* TimeScaler, OUT_tor_BOF_ideal.signals.values)
    % ylabel('[Nm]')
    % title ('Commanded Torque (BOF)')
    xlabel('Orbits [-]');
    linkaxes(ax, 'x')
    % saveas(fighandle,[fig_name,'.fig'])
    saveas(fighandle,[resultsdir, '/DYN/',fig_name,'.fig'])
    close (fighandle)
  end
  
    
  if any(plots2Gen == 10)
    fig_name  = 'DYN10- Attitude and Control Effort';
    fighandle = figure('Name', fig_name);
    ax(1) = subplot(4,1,1);
    plot (OUT_magmomapp_BOF.time* TimeScaler,OUT_magmomapp_BOF.signals.values,'-')
    hold on
    %   plot(t,u,'x')
    title ('Moment')
    ylabel ('[Am]')
    
    ax(2) = subplot(4,1,2);
    plot(OUT_magtor_BOF.time* TimeScaler, OUT_magtor_BOF.signals.values,'-')
    hold on
    title ('Torque')
    ylabel ('[Nm]')
    
    ax(3) = subplot(4,1,3);
    plot(OUT_BOFw_relORB_BOF.time * TimeScaler, OUT_BOFw_relORB_BOF.signals.values*CONSTANTS_par.rad2deg, '-')
    hold on
    title ('BOFw\_relORB\_BOF')
    ylabel ('[deg/s]')
    
    ax(4) = subplot(4,1,4);
    plot(OUT_BOFq_ORB.time * TimeScaler, OUT_BOFq_ORB.signals.values,'-')
    hold on
    title ('BOFq\_ORB')
    ylabel ('[-]')
    xlabel ('[Orbits]')
    linkaxes(ax,'x')
    saveas(fighandle,[resultsdir, '/DYN/',fig_name,'.fig'])
    close (fighandle)
  end
  
  
  
end
